require "yaml"

def load_library(path)
  return_hash = {}
  translations = YAML.load_file(path)
  puts translations
  return_hash["get_emoticon"] = {}
  return_hash["get_meaning"] = {}
  translations.each do |key1, value1|
    return_hash["get_emoticon"][value1[0]] = value1[1]
    return_hash["get_meaning"][value1[1]] = key1
  end
  return return_hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  if hash["get_emoticon"].keys.include?(emoticon)
    return hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  if hash["get_meaning"].keys.include?(emoticon)
    return hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
