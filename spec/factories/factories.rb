# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "john#{n}@doe.com" }

  factory :user do
    name { "John Doe" }
    email { generate(:email) }
  end

  factory :skill do
    user { users(:john) }
  end

  factory :preload do
    name { "My Preload" }
  end

  factory :asset, class: "Models::Asset" do
    name { "Some asset" }
  end

  preload(:users) do
    fixture_with_id(:ivan) { create(:user, id: 1) }
    fixture(:john) { create(:user) }
  end

  preload(:skills) do
    fixture(:ruby) { create(:skill, user: users(:john)) }
  end

  preload(:preloads) do
    fixture(:my)   { create(:preload) }
  end

  preload(:assets) do
    fixture(:asset) { create(:asset) }
  end
end
