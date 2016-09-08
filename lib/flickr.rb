def flickr
  response = HTTParty.get("https://api.flickr.com/services/rest/?method=flickr.photos.search" +
                          "&api_key=#{ENV['FLICKR_KEY']}" +
                          "&tags=tanker,ship" +
                          "&tag_mode=all" +
                          "&format=json" +
                          "&nojsoncallback=1" +
                          "&per_page=500" +
                          "&extras=url_h"
                          )
  body = JSON.parse(response.body)
  photo = body["photos"]["photo"][rand(500)]
  id = photo["id"]
  owner = photo["owner"]
  secret = photo["secret"]
  server_id = photo["server"]
  farm_id = photo["farm"]
  title = photo["title"]
  puts photo

  @photo_url = photo["url_h"]
  # || "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}_h.jpg"
  @photo_link = "https://www.flickr.com/photos/#{owner}/#{id}"

end
