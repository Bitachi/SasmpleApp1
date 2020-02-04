require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout links" do
    get root_path #ルートURLにGETリクエストを送る
    #正しいビューが描写されているか確かめる
    assert_template  'static_pages/home'
    #以下、home, about, help, contact各ページへのリンクが正しくされているか確かめる
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]",contact_path
    #タイトルのテストをする
    #contact_pathのURLにGETリクエストを送る
    get contact_path
    #タイトルが正しいか==でチェック(test/helpers/application/...へアクセス)
    assert_select "title", full_title("Contact")

    #以下、userページのテスト
    get signup_path
    assert_select "title", full_title("Sign up")

  end
end
