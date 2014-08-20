require 'rails_helper'

RSpec.describe Servlet, :type => :model do
  it { expect(subject).to have_db_column(:name) }
  it { expect(subject).to have_db_column(:image) }
  it { expect(subject).to have_db_index(:name).unique(true) }
end
