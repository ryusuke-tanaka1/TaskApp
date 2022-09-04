module ApplicationHelper

  def full_title(page_name = "")
    base_title = "Sample"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
  def text_url_to_link(text)
    require 'uri'
    
    URI.extract(text, ['http', 'https']).uniq.each do |url| # textからhttp,httpsを見つけて、抜き出して変数「url」に代入
      sub_text = "<a href=#{url} target=\"_blank\">#{url}</a>" # #{url}でurlを代入、target=\'_blank\'で新規タブで開く、aタグのコードをsub_textに代入
      text.gsub!(url, sub_text) # text内のurlをsub_textに置き換え
    end
    return text
  end
end