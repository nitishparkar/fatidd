class UserMailer < ActionMailer::Base
  def receive(raw)
    parsed_lines = []

    email = raw.from.first.strip.downcase
    task_date = Date.today
    lines = raw.parts.first.body.decoded.split("\n")
    lines.each do |line|
      break if line =~ /On .+ <.+@.+> wrote:/
      parsed_lines << line unless line == ""
    end

    return parsed_lines, email, task_date
  end
end
