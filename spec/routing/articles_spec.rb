require 'rails_helper'

describe 'articles routes' do
  it '#index' do
    expect(get('/articles')).to route_to('articles#index')
  end

  it '#show' do
    expect(get('/articles/1')).to route_to('articles#show', id: '1')
  end
end
