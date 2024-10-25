class ConsolidatedMigration < ActiveRecord::Migration[7.0]
  def change
    # Usuarios
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true

    # Alumnos
    create_table :alumnos do |t|
      t.integer :numero_alumno
      t.string :email,              null: false, default: ""
      t.string :nombre
      t.string :apellido
      t.string :nombre_usuario
      t.string :avatar
      t.string :encrypted_password
      t.datetime :remember_created_at
      t.timestamps
    end
    add_index :alumnos, :email, unique: true

    # Profesores
    create_table :profesores do |t|
      t.string :nombre
      t.string :apellido
      t.string :nombre_usuario
      t.string :avatar
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps
    end
    add_index :profesores, :email, unique: true
    add_index :profesores, :reset_password_token, unique: true

    # Profesors (tabla redundante)
    create_table :profesors do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    add_index :profesors, :email, unique: true
    add_index :profesors, :reset_password_token, unique: true

    # Cursos
    create_table :cursos do |t|
      t.string :nombre
      t.string :sigla
      t.string :descripcion
      t.references :profesor, null: false, foreign_key: { to_table: :profesores }
      t.timestamps
    end

    # Administradores
    create_table :administradores do |t|
      t.string :correo
      t.string :nombre
      t.string :apellido
      t.string :nombre_usuario
      t.string :contraseña
      t.timestamps
    end

    # Grupos
    create_table :grupos do |t|
      t.string :nombre
      t.references :curso, null: false, foreign_key: true
      t.timestamps
    end

    # Relación many-to-many entre grupos y alumnos
    create_join_table :grupos, :alumnos do |t|
      t.index [:grupo_id, :alumno_id]
      t.index [:alumno_id, :grupo_id]
    end

    # Anuncios
    create_table :anuncios do |t|
      t.references :curso, null: false, foreign_key: true
      t.references :profesor, null: false, foreign_key: { to_table: :profesores }
      t.string :titulo
      t.text :contenido
      t.timestamps
    end

    # Archivos
    create_table :archivos do |t|
      t.string :nombre
      t.references :curso, null: false, foreign_key: true
      t.timestamps
    end

    # Inscripciones
    create_table :inscripcions do |t|
      t.references :alumno, null: false, foreign_key: true
      t.references :curso, null: false, foreign_key: true
      t.timestamps
    end

    # Evaluaciones
    create_table :evaluaciones do |t|
      t.references :curso, null: false, foreign_key: true
      t.references :alumno, null: false, foreign_key: true
      t.string :nombre_evaluacion
      t.integer :calificacion
      t.date :fecha_inicio
      t.date :fecha_termino
      t.timestamps
    end

    # Evaluacions (otra tabla redundante)
    create_table :evaluacions do |t|
      t.references :curso, null: false, foreign_key: true
      t.references :alumno, null: false, foreign_key: true
      t.string :nombre_evaluacion
      t.float :calificacion
      t.date :fecha_inicio
      t.date :fecha_termino
      t.timestamps
    end

    # Material de estudio
    create_table :material_estudios do |t|
      t.references :curso, null: false, foreign_key: true
      t.date :fecha
      t.text :descripcion
      t.string :tipo_archivo
      t.timestamps
    end

    # ActiveStorage tables
    create_table :active_storage_blobs do |t|
      t.string   :key,          null: false
      t.string   :filename,     null: false
      t.string   :content_type
      t.text     :metadata
      t.string   :service_name, null: false
      t.bigint   :byte_size,    null: false
      t.string   :checksum
      t.datetime :created_at, null: false
      t.index [ :key ], unique: true
    end

    create_table :active_storage_attachments do |t|
      t.string     :name, null: false
      t.references :record, null: false, polymorphic: true, index: false
      t.references :blob, null: false
      t.datetime :created_at, null: false
      t.index [ :record_type, :record_id, :name, :blob_id ], name: :index_active_storage_attachments_uniqueness, unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end

    create_table :active_storage_variant_records do |t|
      t.belongs_to :blob, null: false
      t.string :variation_digest, null: false
      t.index [ :blob_id, :variation_digest ], name: :index_active_storage_variant_records_uniqueness, unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
  end
end
