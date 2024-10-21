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

ActiveRecord::Schema[7.0].define(version: 2024_10_21_224550) do
  create_table "administradores", force: :cascade do |t|
    t.string "correo"
    t.string "nombre"
    t.string "apellido"
    t.string "nombre_usuario"
    t.string "contraseña"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alumnos", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numero_alumno"
    t.string "nombre"
    t.string "apellido"
    t.index ["email"], name: "index_alumnos_on_email", unique: true
    t.index ["reset_password_token"], name: "index_alumnos_on_reset_password_token", unique: true
  end

  create_table "alumnos_cursos", id: false, force: :cascade do |t|
    t.integer "alumno_id", null: false
    t.integer "curso_id", null: false
  end

  create_table "anuncios", force: :cascade do |t|
    t.integer "curso_id", null: false
    t.integer "profesor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_anuncios_on_curso_id"
    t.index ["profesor_id"], name: "index_anuncios_on_profesor_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.string "nombre"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profesor_id"
    t.string "descripcion"
  end

  create_table "evaluaciones", force: :cascade do |t|
    t.integer "curso_id", null: false
    t.integer "alumno_id", null: false
    t.string "nombre_evaluacion"
    t.integer "calificacion"
    t.date "fecha_inicio"
    t.date "fecha_termino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumno_id"], name: "index_evaluaciones_on_alumno_id"
    t.index ["curso_id"], name: "index_evaluaciones_on_curso_id"
  end

  create_table "evaluacions", force: :cascade do |t|
    t.integer "curso_id", null: false
    t.integer "alumno_id", null: false
    t.string "nombre_evaluacion"
    t.float "calificacion"
    t.date "fecha_inicio"
    t.date "fecha_termino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumno_id"], name: "index_evaluacions_on_alumno_id"
    t.index ["curso_id"], name: "index_evaluacions_on_curso_id"
  end

  create_table "material_estudios", force: :cascade do |t|
    t.integer "curso_id", null: false
    t.date "fecha"
    t.text "descripcion"
    t.string "tipo_archivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_material_estudios_on_curso_id"
  end

  create_table "profesores", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "nombre_usuario"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "lista_cursos"
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["reset_password_token"], name: "index_profesores_on_reset_password_token"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "anuncios", "cursos"
  add_foreign_key "anuncios", "profesors"
  add_foreign_key "evaluaciones", "alumnos"
  add_foreign_key "evaluaciones", "cursos"
  add_foreign_key "evaluacions", "alumnos"
  add_foreign_key "evaluacions", "cursos"
  add_foreign_key "material_estudios", "cursos"
end
