require 'spec_helper'

feature 'The image list page' do
  scenario 'displays the list of available maintenance options' do
    page.visit '/images'
    expect(page).to have_selector('table#images')
  end
end