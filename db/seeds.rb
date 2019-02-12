# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

team_list = [
  { full_name: 'Boston Celtics', abbr_name: 'BOS', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/BOS_logo.svg' },
  { full_name: 'Brooklyn Nets', abbr_name: 'BKN', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/BKN_logo.svg' },
  { full_name: 'New York Knicks', abbr_name: 'NYK', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/NYK_logo.svg' },
  { full_name: 'Philadelphia 76ers', abbr_name: 'PHI', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/PHI_logo.svg' },
  { full_name: 'Toronto Raptors', abbr_name: 'TOR', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/TOR_logo.svg' },
  { full_name: 'Chicago Bulls', abbr_name: 'CHI', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/CHI_logo.svg' },
  { full_name: 'Cleveland Cavaliers', abbr_name: 'CLE', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/CLE_logo.svg' },
  { full_name: 'Detroit Pistons', abbr_name: 'DET', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/DET_logo.svg' },
  { full_name: 'Indiana Pacers', abbr_name: 'IND', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/IND_logo.svg' },
  { full_name: 'Milwaukee Bucks', abbr_name: 'MIL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/MIL_logo.svg' },
  { full_name: 'Atlanta Hawks', abbr_name: 'ATL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/ATL_logo.svg' },
  { full_name: 'Charlotte Hornets', abbr_name: 'CHA', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/CHA_logo.svg' },
  { full_name: 'Miami Heat', abbr_name: 'MIA', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/MIA_logo.svg' },
  { full_name: 'Orlando Magic', abbr_name: 'ORL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/ORL_logo.svg' },
  { full_name: 'Washington Wizards', abbr_name: 'WAS', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/WAS_logo.svg' },
  { full_name: 'Denver Nuggets', abbr_name: 'DEN', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/DEN_logo.svg' },
  { full_name: 'Minnesota Timberwolves', abbr_name: 'MIN', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/MIN_logo.svg' },
  { full_name: 'Oklahoma City Thunder', abbr_name: 'OKC', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/OKC_logo.svg' },
  { full_name: 'Portland Trail Blazers', abbr_name: 'POR', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/POR_logo.svg' },
  { full_name: 'Utah Jazz', abbr_name: 'UTA', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/UTA_logo.svg' },
  { full_name: 'Golden State Warriors', abbr_name: 'GSW', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/GSW_logo.svg' },
  { full_name: 'LA Clippers', abbr_name: 'LAC', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/LAC_logo.svg' },
  { full_name: 'Los Angeles Lakers', abbr_name: 'LAL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/LAL_logo.svg' },
  { full_name: 'Phoenix Suns', abbr_name: 'PHX', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/PHX_logo.svg' },
  { full_name: 'Sacramento Kings', abbr_name: 'SAC', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/SAC_logo.svg' },
  { full_name: 'Dallas Mavericks', abbr_name: 'DAL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/DAL_logo.svg' },
  { full_name: 'Houston Rockets', abbr_name: 'HOU', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/HOU_logo.svg' },
  { full_name: 'Memphis Grizzlies', abbr_name: 'MEM', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/MEM_logo.svg' },
  { full_name: 'New Orleans Pelicans', abbr_name: 'NOP', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/NOP_logo.svg' },
  { full_name: 'San Antonio Spurs', abbr_name: 'SAS', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/SAS_logo.svg' }
]