class BilibiliCidJob < ActiveJob::Base
  queue_as :default

  def perform(episode_id, aid)

  	api = 'http://www.bilibili.com/m/html5?aid=' + aid.to_s + '&page=1'

	  # store into database
	  episode = Episode.find_by_id(episode_id)
	  episode.html5 = api
	  episode.save

  end
end
