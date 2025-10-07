class CmsBlock < ApplicationRecord
  has_rich_text :content
  has_rich_text :title

  has_many_attached :images

  enum :block_type, [ :image_block, :content_block, :qa_block ], default: :content_block
end
