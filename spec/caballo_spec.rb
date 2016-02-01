require 'spec_helper'


describe User do

  # Migrations
  it { should have_db_column(:email) }

  # Validations
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:hashed_password) }

  # Associations
  it { should have_many(:playlists) }

  # Indexes
  xit { should have_index(:playlist) }
end