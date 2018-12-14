# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here

  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
 hash = YAML.load_file(file_path)
 hash.each do |emotion, symbol|

   emoticons["get_meaning"][symbol[1]] = emotion
   emoticons["get_emoticon"][symbol[0]] = symbol[1]
    end
   emoticons
 end


def get_japanese_emoticon(file_path, english_emo)
  # code goes here
  emoticons = load_library(file_path)
   emoticons["get_emoticon"].each do |eng, jp|

     if eng == english_emo
       return jp
     elsif !(emoticons["get_emoticon"].keys.include?(english_emo))
       return "Sorry, that emoticon was not found"
    end
  end
end

def get_english_meaning(file_path, jp_emo)
  # code goes here
  emoticons = load_library(file_path)
   emoticons["get_meaning"].each do |jp, meaning|

     if jp == jp_emo
       return meaning
     elsif !(emoticons["get_meaning"].keys.include?(jp_emo))
       return "Sorry, that emoticon was not found"
     end
   end
end
