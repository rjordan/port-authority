require 'spec_helper'

feature 'The servlet creation page' do
  scenario 'displays a form' do
    data = double(id: '1', info: {'RepoTags'=>['test:1']} )
    expect(Docker::Image).to receive(:all).and_return([data])
    page.visit '/images/1/servlets/new'
    expect(page).to have_selector('form#new_servlet')
    within('form#new_servlet') do
      expect(page).to have_field('Name', type: 'text')
      expect(page).to have_field('Image', type: 'select')
    end
  end
end