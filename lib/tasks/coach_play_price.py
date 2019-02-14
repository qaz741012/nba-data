import requests
from selenium import webdriver
from selenium.webdriver.support.ui import Select
from bs4 import BeautifulSoup
import numpy as np
import pandas as pd
import yaml
import MySQLdb

### Coach-Play隊伍：隊伍id 對照雜湊 ##########
team_hash = {
    '76人Philadelphia': 4,
    '公牛Chicago': 6,
    '公鹿Milwaukee': 10,
    '勇士Golden State': 21,
    '國王Sacramento': 25,
    '塞爾蒂克Boston': 1,
    '太陽Phoenix': 24,
    '尼克New York': 3,
    '巫師Washington': 15,
    '快艇LA Clippers': 22,
    '拓荒者Portland': 19,
    '暴龍Toronto': 5,
    '活塞Detroit': 8,
    '湖人LA Lakers': 23,
    '溜馬Indiana': 9,
    '火箭Houston': 27,
    '灰熊Memphis': 28,
    '灰狼Minnesota': 17,
    '熱火Miami': 13,
    '爵士Utah': 20,
    '獨行俠Dallas': 26,
    '籃網Brooklyn': 2,
    '老鷹Atlanta': 11,
    '金塊Denver': 16,
    '雷霆Oklahoma City': 18,
    '馬刺San Antonio': 30,
    '騎士Cleveland': 7,
    '魔術Orlando': 14,
    '鵜鶘New Orleans': 29,
    '黃蜂Charlotte': 12
}


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
driver = webdriver.Chrome(options=options)

url = 'http://www.coach-play.com.tw/index.asp?s=players'
driver.get(url)

prices = range(150000, 950000, 50000)
positions = ["F", "C", "G"]
order = "1"   # 高->低 (2為低->高)

for price in prices:
    for position in positions:

        table = driver.find_element_by_xpath("//table[@style='COLOR: #666666; FONT-SIZE: 9pt']")
        selects = table.find_elements_by_tag_name("select")
        pos_select, pri_select, ord_select = selects[1], selects[2], selects[3]
        submit = table.find_elements_by_tag_name("input")[0]

        Select(pos_select).select_by_value(position)
        driver.execute_script("arguments[0].options[11].setAttribute('value', '{0}')".format(price), pri_select)
        Select(pri_select).select_by_visible_text("650000")
        Select(ord_select).select_by_value(order)
        submit.click()

        page_source = driver.page_source
        soup = BeautifulSoup(page_source, "xml")

        # 爬下來的資料型態，共九欄，分別是：
        # 0. 球隊：
        # 1. 尼克New York
        # 2. 【平均成績】得分：8.6籃板：8.6助攻：2.1
        # 3. #
        # 4. 7        (此欄為背號)
        # 5. N. VonlehPF
        # 6. 位置：大前鋒
        # 7. 身價：250000
        # 8. 總積分：2488　平均積分：48.8

        try:
            players = soup.find_all('td', bgcolor="#FFFFFF", width="538")[0]
        except IndexError:
            continue
        else:
            player_data = players.stripped_strings
            


driver.quit()
db.commit()
db.close()