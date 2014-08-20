require 'spec_helper'

feature 'The image list page' do
  scenario 'displays the list of available images' do
    stub1 = double(id: 1, info: { 'RepoTags' => ['bogus:latest','bogus:tag1'] })
    stub2 = double(id: 2, info: { 'RepoTags' => ['bogus:tag2'] })
    stub_list = [stub1, stub2]
    expect(Docker::Image).to receive(:all).and_return(stub_list)
    page.visit '/images'
    expect(page).to have_selector('table#images')
    stub_list.each do |s|
      within("table#images tr[@data-id='#{s.id}'] td.actions") do
        expect(page).to have_link('Delete')
        expect(page).to have_link('Create', new_servlet_path(image: s.id))
      end
    end
  end
end