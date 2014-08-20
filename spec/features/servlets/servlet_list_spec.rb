require 'spec_helper'

feature 'The servlet list page' do
  scenario 'displays the list of servlets' do
    page.visit '/servlets'
    expect(page).to have_selector('table#servlets')
  end
end