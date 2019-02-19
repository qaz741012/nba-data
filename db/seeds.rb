# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Area.destroy_all
Subarea.destroy_all
Team.destroy_all
puts "Database cleaned."

area_list = [
  { id: 1, name: 'east' },
  { id: 2, name: 'west' }
]
Area.create(area_list)
puts "Area created."

subarea_list = [
  { id: 1, name: 'Atlantic', area_id: 1 },
  { id: 2, name: 'Central', area_id: 1 },
  { id: 3, name: 'Southeast', area_id: 1 },
  { id: 4, name: 'Northwest', area_id: 2 },
  { id: 5, name: 'Pacific', area_id: 2 },
  { id: 6, name: 'Southwest', area_id: 2 }
]
Subarea.create(subarea_list)
puts "Subarea created."

team_list = [
  { id: 1, full_name: 'Boston Celtics', abbr_name: 'BOS', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/BOS_logo.svg', subarea_id: 1 },
  { id: 2, full_name: 'Brooklyn Nets', abbr_name: 'BKN', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/BKN_logo.svg', subarea_id: 1 },
  { id: 3, full_name: 'New York Knicks', abbr_name: 'NYK', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/NYK_logo.svg', subarea_id: 1 },
  { id: 4, full_name: 'Philadelphia 76ers', abbr_name: 'PHI', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/PHI_logo.svg', subarea_id: 1 },
  { id: 5, full_name: 'Toronto Raptors', abbr_name: 'TOR', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/TOR_logo.svg', subarea_id: 1 },
  { id: 6, full_name: 'Chicago Bulls', abbr_name: 'CHI', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/CHI_logo.svg', subarea_id: 2 },
  { id: 7, full_name: 'Cleveland Cavaliers', abbr_name: 'CLE', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/CLE_logo.svg', subarea_id: 2 },
  { id: 8, full_name: 'Detroit Pistons', abbr_name: 'DET', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/DET_logo.svg', subarea_id: 2 },
  { id: 9, full_name: 'Indiana Pacers', abbr_name: 'IND', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/IND_logo.svg', subarea_id: 2 },
  { id: 10, full_name: 'Milwaukee Bucks', abbr_name: 'MIL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/MIL_logo.svg', subarea_id: 2 },
  { id: 11, full_name: 'Atlanta Hawks', abbr_name: 'ATL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/ATL_logo.svg', subarea_id: 3 },
  { id: 12, full_name: 'Charlotte Hornets', abbr_name: 'CHA', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/CHA_logo.svg', subarea_id: 3 },
  { id: 13, full_name: 'Miami Heat', abbr_name: 'MIA', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/MIA_logo.svg', subarea_id: 3 },
  { id: 14, full_name: 'Orlando Magic', abbr_name: 'ORL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/ORL_logo.svg', subarea_id: 3 },
  { id: 15, full_name: 'Washington Wizards', abbr_name: 'WAS', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/WAS_logo.svg', subarea_id: 3 },
  { id: 16, full_name: 'Denver Nuggets', abbr_name: 'DEN', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/DEN_logo.svg', subarea_id: 4 },
  { id: 17, full_name: 'Minnesota Timberwolves', abbr_name: 'MIN', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/MIN_logo.svg', subarea_id: 4 },
  { id: 18, full_name: 'Oklahoma City Thunder', abbr_name: 'OKC', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/OKC_logo.svg', subarea_id: 4 },
  { id: 19, full_name: 'Portland Trail Blazers', abbr_name: 'POR', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/POR_logo.svg', subarea_id: 4 },
  { id: 20, full_name: 'Utah Jazz', abbr_name: 'UTA', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/UTA_logo.svg', subarea_id: 4 },
  { id: 21, full_name: 'Golden State Warriors', abbr_name: 'GSW', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/GSW_logo.svg', subarea_id: 5 },
  { id: 22, full_name: 'LA Clippers', abbr_name: 'LAC', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/LAC_logo.svg', subarea_id: 5 },
  { id: 23, full_name: 'Los Angeles Lakers', abbr_name: 'LAL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/LAL_logo.svg', subarea_id: 5 },
  { id: 24, full_name: 'Phoenix Suns', abbr_name: 'PHX', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/PHX_logo.svg', subarea_id: 5 },
  { id: 25, full_name: 'Sacramento Kings', abbr_name: 'SAC', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/SAC_logo.svg', subarea_id: 5 },
  { id: 26, full_name: 'Dallas Mavericks', abbr_name: 'DAL', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/DAL_logo.svg', subarea_id: 6 },
  { id: 27, full_name: 'Houston Rockets', abbr_name: 'HOU', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/HOU_logo.svg', subarea_id: 6 },
  { id: 28, full_name: 'Memphis Grizzlies', abbr_name: 'MEM', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/MEM_logo.svg', subarea_id: 6 },
  { id: 29, full_name: 'New Orleans Pelicans', abbr_name: 'NOP', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/NOP_logo.svg', subarea_id: 6 },
  { id: 30, full_name: 'San Antonio Spurs', abbr_name: 'SAS', remote_logo_url: 'https://stats.nba.com/media/img/teams/logos/SAS_logo.svg', subarea_id: 6 }
]
Team.create(team_list)
puts "Team created."