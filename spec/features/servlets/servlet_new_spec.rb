require 'spec_helper'

feature 'The servlet creation page' do
  scenario 'displays a form' do
    image = FactoryGirl.build(:image)
    allow(Image).to receive(:find).and_return image
    page.visit '/images/1/servlets/new'
    expect(page).to have_selector('form#new_servlet')
    within('form#new_servlet') do
      expect(page).to have_field('Name', type: 'text')
      expect(page).to have_field('Image', type: 'select')
    end
  end
end