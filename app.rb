require 'sinatra'

get '/meta' do
  metaTags = {
    'og:url'              => params['url'],
    'og:title'            => params['title'],
    'og:description'      => params['description'],
    'og:site_name'        => params['site_name'],
    'og:image'            => params['image'],
    'og:app_id'           => params['app_id'],

    'twitter:card'        => 'summary_large_image',
    'twitter:site'        => params['twitter_user'],
    'twitter:title'       => params['title'],
    'twitter:description' => params['description'],
    'twitter:image'       => params['image'],
  }

  erb :application, locals: {request_url: request.url, metas: metaTags}
end
