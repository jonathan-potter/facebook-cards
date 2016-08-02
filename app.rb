require 'sinatra'

def stringified_params
  params.map do |key, value|
    [key, value].join('=')
  end.join('&')
end

def shared_meta_tags
  {
    # facebook / pinterest
    'og:url'              => params['url'],
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

def first_meta_tags
  meta_tags = shared_meta_tags

  meta_tags['og:url'] = "http://card-bouncer.herokuapp.com/meta?#{stringified_params}"

  meta_tags
end

get '/first' do
  erb :application, locals: {request_url: request.url, meta_tags: first_meta_tags}
end

get '/second' do
  erb :application, locals: {request_url: request.url, meta_tags: shared_meta_tags}
end
