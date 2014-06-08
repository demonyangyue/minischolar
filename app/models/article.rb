class Article < ActiveRecord::Base
  belongs_to :user

  mount_uploader :article_attachment, ArticleUploader
  
  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
      "title"        => read_attribute(:title),
      "url"         => self.article_attachment.url,
      "delete_url"  => article_path(self),
      "delete_type" => "DELETE",
    }
  end

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks


  mappings _source: { excludes: ['attachment'] } do
      indexes :id, type: 'integer'
      indexes :title
      indexes :attachment, type: 'attachment',
      :fields => {
        :date => {:analyzed => 'no', :store => 'yes'},
        :title => { :store => 'yes', :term_vector => 'with_positions_offsets' },
        :author => {:analyzed => 'no', :store => 'yes'},
        :keywords => {:analyzed => 'no', :store => 'yes'}, 
        :attachment       => { :term_vector => 'with_positions_offsets', :store => 'yes' },
      }
    end

  Article.__elasticsearch__.create_index! 
  Article.__elasticsearch__.refresh_index!


  def attachment
    path_to_attachment = article_attachment.path
    Base64.encode64(open(path_to_attachment) { |file| file.read })
  end

  def to_indexed_json
    to_json(methods: [:attachment])
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'attachment']
          }
        },
        highlight: {
          pre_tags: ['<em class="label label-highlight">'],
          post_tags: ['</em>'],
          fields: {
            title:   { number_of_fragments: 0 },
            attachment: { fragment_size: 25 }
          }
        }
      }
    )
  end
end
