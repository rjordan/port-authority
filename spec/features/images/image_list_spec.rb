require 'spec_helper'

feature 'The image list page' do
  scenario 'displays the list of available maintenance options' do
    page.visit '/images'
    expect(page).to have_selector('table#images')
    expect(page).to have_selector('table#images tr td.actions')
    expect(page).to have_selector('table#images tr td.actions a.delete')
  end
end