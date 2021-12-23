json.array!(@tasks) do |task|
  json.title task.title
  json.url "/tasks/" + task.id.to_s
  json.start task.starts_at
  json.end task.ends_at
end
