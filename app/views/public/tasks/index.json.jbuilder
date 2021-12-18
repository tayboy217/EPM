json.array!(@tasks) do |task|
  json.title '<a class="text-decoration-none" href="/tasks/' + task.id.to_s + '" style="color: #475263;">' + task.title + '</a>'
  json.start task.starts_at
  json.end task.ends_at
end