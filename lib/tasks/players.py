### 每隊伍的球員名單 ##########

from selenium import webdriver
from selenium.webdriver.support.ui import Select
from bs4 import BeautifulSoup
import yaml
import MySQLdb
import datetime as dt

# Environment
env = 'development'

# load database configurations and connect to database
with open("config/database.yml", "r") as yml:
    config = yaml.load(yml)
    user = config[env]['username']
    passwd = config[env]['password']
    db_name = config[env]['database']
    db = MySQLdb.connect(host='localhost', user=user, passwd=passwd, db=db_name, charset='utf8')

curs = db.cursor()

options = webdriver.ChromeOptions()
options.add_argument('headless')
options.add_argument('user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.96 Safari/537.36')
driver = webdriver.Chrome(options=options)

url = 'https://stats.nba.com/teams/'
driver.get(url)
page_source = driver.page_source

all_teams_soup = BeautifulSoup(page_source, "xml")

# 先抓到每個球隊的網址，再分別進入球隊頁面抓球員資料
team_a_tags = all_teams_soup.select(".stats-team-list")[0].select("section a")
for team_a_tag in team_a_tags:
    team_name = team_a_tag.text.strip()
    team_link = "https://stats.nba.com" + team_a_tag['href']

    # Query team id
    curs.execute("SELECT id FROM teams WHERE full_name = '{0}'".format(team_name))
    team_id = curs.fetchone()[0]

    driver.get(team_link)
    page_source = driver.page_source
    team_soup = BeautifulSoup(page_source, "xml")

# 爬下來的資料型態，共九欄，分別是：
        # 0. Jayson Tatum   (name)
        # 1. #0             (背號)
        # 2. F              (Position)
        # 3. 6-8            (Height)
        # 4. 208 lbs        (Weight)
        # 5. MAR 03, 1998   (Birthdate)
        # 6. 20             (Age)
        # 7. 1              (EXP)
        # 8. Duke           (School)

    players = team_soup.select("nba-stat-table")[0].table.tbody.select("tr")
    for player in players:
        data = list(player.stripped_strings)
        full_name = data[0]
        back_number = int(data[1][1:])
        position = data[2]
        birthdate = dt.datetime.strptime(data[5], "%b %d, %Y").date()

        # Insert player data
        sql = "INSERT INTO players (full_name, back_number, position, birthdate, team_id, created_at, updated_at) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        val = (full_name, back_number, position, birthdate, team_id, dt.datetime.utcnow(), dt.datetime.utcnow())
        curs.execute(sql, val)

driver.quit()
db.commit()
db.close()