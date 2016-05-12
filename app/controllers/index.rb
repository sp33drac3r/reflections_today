get '/' do
  erb :index
end

post '/save' do
  clean_post = clean_post(params[:content])
  post = Post.create(user_id: rand(1..100), text: clean_post)
  post_array = analyze_post(clean_post)
  post_array.each do |paragraph|
    paragraph["post_id"] = post.id
    Paragraph.create(paragraph)
  end
  redirect '/'
end
