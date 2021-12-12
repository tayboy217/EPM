json.array!(@tasks) do |task|
  json.extract! task, :id, :title
  json.start task.starts_at
  json.end task.ends_at
end