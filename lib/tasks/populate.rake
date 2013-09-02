namespace :db do
  desc "Calculating karma sum of each user"
  task :populate_user_karma => :environment do
    ActiveRecord::Base.transaction do
      User.all.each do |user, index|
        user.update_attributes(karma: user.total_karma)
      end
    end
  end
end
