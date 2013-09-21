namespace :db do
  desc "Earse all data, migrate and populate data"
  task :populate do
    p "Migrating.."
    Rake::Task['db:migrate:reset'].invoke

    users = []
    p "Creating users"
    [
      ["nitish", "nitish@example.com"],
      ["akshay", "akshay@example.com"],
      ["adil", "adil@example.com"],
      ["sitara", "sitara@example.com"],
    ].each do |user|
      users << User.create!(username: user[0], email: user[1], password: "qwer1234" )
    end

    date_range = ((Date.today - 3.days)..(Date.today + 3.days)).to_a
    words = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tellus justo, gravida nec consequat sed, scelerisque pulvinar est. Nam mauris ante, posuere volutpat interdum eu, condimentum nec tellus. Aliquam nec vehicula leo. Etiam accumsan posuere quam nec posuere. Duis placerat blandit tellus, at volutpat mi elementum ac. Donec sodales sagittis porta. Ut condimentum ullamcorper ligula. Maecenas et sagittis enim. Vestibulum enim magna, ornare in felis non, sagittis sodales lorem. Integer quis blandit lectus. Aenean est lorem, hendrerit vel tellus nec, viverra bibendum nisl. Sed ut rhoncus lacus. Integer mi massa, porttitor non imperdiet sit amet, interdum non felis. Mauris et sem in augue aliquet viverra ac quis tortor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla porttitor lobortis massa, eget pulvinar lectus dignissim et. Cras ligula velit, luctus eu molestie sed, vehicula eget risus. In posuere neque eu risus varius fermentum. Quisque sit amet dui at nibh eleifend elementum eget vel augue. Quisque id egestas nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam varius laoreet lorem, a pellentesque dui suscipit sed. Nam sed purus eros. Ut tempor accumsan nibh eget semper. Nullam pulvinar libero et ornare adipiscing. Mauris gravida gravida fringilla.".split(/\W+/)
    tags = %w(#mytg #treetins #fizzcount #athens #bpe)
    duration = (10..240).to_a

    p "Creating Tasks"
    users.each do |user|
      30.times do
        user.tasks.create!(task_date: date_range.sample, content: (tags.sample + " " + words.sample(10).join(" ")), duration: duration.sample)
      end
    end
  end
end
