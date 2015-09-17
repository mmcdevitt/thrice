Fabricator(:user) do
  email { Faker::Internet.email }
  password 'password'
  name 'mmcdevi1'
end