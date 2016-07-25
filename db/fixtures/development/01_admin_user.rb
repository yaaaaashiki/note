AdminUser.seed(
  :id,
  { id: 1,
    user_id: 1,
    created_at: DateTime.current,
    updated_at: DateTime.current 
  },
  { id: 2,
    user_id: 2,
    created_at: DateTime.current.yesterday,
    updated_at: DateTime.current.yesterday
  } 
)
