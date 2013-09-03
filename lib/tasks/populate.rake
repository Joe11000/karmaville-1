namespace :db do
  desc "Populates karma_points_sum column in users table"
  task :populate_user_karma => :environment do
    users = User.all
    ActiveRecord::Base.transaction do
      users.length.times do |i|
        user = User.find(i + 1)
        user.karma = KarmaPoint.where(user_id: user.id).pluck(:value).reduce(:+)
        user.save(:validate => false)
      end
    end
  end
end


