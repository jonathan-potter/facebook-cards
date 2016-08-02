require 'sinatra'

def meta_tags
  {
    # chute
    'redirect_url'        => params['url'],

    # facebook / pinterest
    'og:title'            => params['title'],
    'og:description'      => params['description'],
    'og:site_name'        => params['site_name'],
    'og:image'            => params['image'],
    'og:app_id'           => params['app_id'],

    # twitter
    'twitter:card'        => 'summary_large_image',
    'twitter:site'        => params['twitter_user'],
    'twitter:title'       => params['title'],
    'twitter:description' => params['description'],
    'twitter:image'       => params['image'],
  }
end

get '/meta' do
  erb :application, locals: {request_url: request.url, meta_tags: meta_tags}
end
