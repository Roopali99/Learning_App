# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_06_100617) do

  create_table "accounts", force: :cascade do |t|
    t.string "student_name"
    t.integer "mobile"
    t.string "email"
    t.date "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "otp"
    t.string "token"
  end

  create_table "analytics", force: :cascade do |t|
    t.integer "total_ans_ampt"
    t.integer "correct_ans"
    t.integer "wrong_ans"
    t.float "score"
    t.float "accuracy"
    t.integer "speed"
    t.datetime "time"
    t.integer "exercise_id", null: false
    t.integer "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_analytics_on_account_id"
    t.index ["exercise_id"], name: "index_analytics_on_exercise_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "solution"
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "board_nm"
    t.string "board_description"
    t.string "board_logo"
    t.string "string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_id", null: false
    t.index ["account_id"], name: "index_boards_on_account_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "chapter_nm"
    t.integer "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_chapters_on_subject_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "content_nm"
    t.integer "video_count"
    t.integer "pdf_count"
    t.integer "chapter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_contents_on_chapter_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.integer "ex_no"
    t.boolean "ex_status"
    t.integer "num_of_ques"
    t.time "total_time"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lesso_id", null: false
    t.index ["lesso_id"], name: "index_exercises_on_lesso_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "chapter_nm"
    t.integer "video_count"
    t.integer "pdf_count"
    t.integer "subjects_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subjects_id"], name: "index_lessons_on_subjects_id"
  end

  create_table "lessos", force: :cascade do |t|
    t.string "chapter_nm"
    t.integer "video_count"
    t.integer "pdf_count"
    t.integer "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_lessos_on_subject_id"
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "pdfs", force: :cascade do |t|
    t.string "pdf_name"
    t.string "pdf_link"
    t.integer "pdf_length"
    t.boolean "pdf_status"
    t.integer "pdf_read_length"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lesso_id", null: false
    t.index ["lesso_id"], name: "index_pdfs_on_lesso_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "ques_no"
    t.string "ques"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.string "option4"
    t.time "time"
    t.integer "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_questions_on_exercise_id"
  end

  create_table "standards", force: :cascade do |t|
    t.integer "class_id"
    t.integer "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_standards_on_board_id"
  end

  create_table "student_solutions", force: :cascade do |t|
    t.boolean "ques_status"
    t.string "option_selected"
    t.boolean "status"
    t.boolean "marked_later"
    t.boolean "skip"
    t.time "time_taken"
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_student_solutions_on_question_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_nm"
    t.integer "standard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["standard_id"], name: "index_subjects_on_standard_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "video_nm"
    t.string "video_link"
    t.integer "video_len"
    t.string "video_logo"
    t.boolean "watched_status"
    t.time "time_watched"
    t.string "notes"
    t.boolean "like"
    t.boolean "dislike"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lesso_id", null: false
    t.index ["lesso_id"], name: "index_videos_on_lesso_id"
  end

  add_foreign_key "analytics", "accounts"
  add_foreign_key "analytics", "exercises"
  add_foreign_key "answers", "questions"
  add_foreign_key "boards", "accounts"
  add_foreign_key "chapters", "subjects"
  add_foreign_key "contents", "chapters"
  add_foreign_key "exercises", "lessos"
  add_foreign_key "lessons", "subjects", column: "subjects_id"
  add_foreign_key "lessos", "subjects"
  add_foreign_key "oauth_access_tokens", "accounts", column: "resource_owner_id"
  add_foreign_key "pdfs", "lessos"
  add_foreign_key "questions", "exercises"
  add_foreign_key "standards", "boards"
  add_foreign_key "student_solutions", "questions"
  add_foreign_key "subjects", "standards"
  add_foreign_key "videos", "lessos"
end
