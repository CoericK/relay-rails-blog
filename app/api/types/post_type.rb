# Initialize base type to define a PostType using given fields
PostType = DefineType.new(Post).to_graphql_type(
  [:title, :slug, :user_id, :body, :excerpt, :comments_count,
  :votes_count, :created_at]
)

# Add custom fields and connection to the PostType
PostType.fields['user'] = UserField
PostType.fields['voted'] = VotedField
PostType.fields['tags'] = TagsField
PostType.fields['comments'] = GraphQL::Relay::ConnectionField.create(
  CommentsField
)
