require 'rails_helper'

describe 'articles routes' do
  it '#index' do
    expect(get('/articles')).to route_to('articles#index')
  end
  
  it '#show' do
    expect(get('/articles/1')).to route_to('articles#show', id: '1')
  end
  
  it '#create' do
    expect(post('/articles')).to route_to('articles#create')
  end

  it '#update' do
    expect(put('/articles/1')).to route_to('articles#update', id: '1')
    expect(patch('/articles/1')).to route_to('articles#update', id: '1')
  end
end
