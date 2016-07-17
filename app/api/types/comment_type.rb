# Initialize base type to define a CommentType using given fields
CommentType = BaseType.new(Comment).to_graphql_type(
  [:body, :votes_count, :created_at]
)

# Add custom fields and connection to the CommentType
CommentType.fields['user'] = UserField
CommentType.fields['voted'] = VotedField
CommentType.fields['is_owner'] = IsOwnerField