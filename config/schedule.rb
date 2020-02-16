# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# logが書き込まれるファイルの設定
set :output, "log/scraping.log"

# 開発環境or本番環境の設定
set :environment, :development

# 1分毎に回す
#ここに直接user情報を含めたコマンドライン引数を描いてもいいかも
every 1.minute do
  exec 'python3  ./test2.py "02" "14" "22" "00" "在来線列車" "東京" "横浜" "MsKONPkSOov7Y9p2pxt8IOPlWHCsBJ2RXxRFSrUmWg9"'
end
