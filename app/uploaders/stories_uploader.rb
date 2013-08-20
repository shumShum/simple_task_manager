class StoriesUploader < ApplicationUploader
  process :resize_to_fit => [400, 400]
end