# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_03_150302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "almacenes", force: :cascade do |t|
    t.string "alma_desc"
    t.boolean "alma_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cajas", force: :cascade do |t|
    t.bigint "tipo_caja_id"
    t.bigint "tmov_caja_id"
    t.date "caja_fecha"
    t.float "caja_monto"
    t.string "caja_desc"
    t.boolean "caja_es"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipo_caja_id"], name: "index_cajas_on_tipo_caja_id"
    t.index ["tmov_caja_id"], name: "index_cajas_on_tmov_caja_id"
  end

  create_table "farmacos", force: :cascade do |t|
    t.string "farma_desc"
    t.boolean "farma_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laboratorios", force: :cascade do |t|
    t.string "lab_desc"
    t.boolean "lab_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prod_farmas", force: :cascade do |t|
    t.bigint "producto_id"
    t.bigint "farmaco_id"
    t.float "pfar_cant", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farmaco_id"], name: "index_prod_farmas_on_farmaco_id"
    t.index ["producto_id"], name: "index_prod_farmas_on_producto_id"
  end

  create_table "prod_sectores", force: :cascade do |t|
    t.bigint "sectore_id"
    t.bigint "producto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_prod_sectores_on_producto_id"
    t.index ["sectore_id"], name: "index_prod_sectores_on_sectore_id"
  end

  create_table "productos", force: :cascade do |t|
    t.bigint "laboratorio_id"
    t.bigint "rubro_id"
    t.string "prod_desc"
    t.float "prod_precio"
    t.boolean "prod_active", default: true
    t.string "prod_bcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratorio_id"], name: "index_productos_on_laboratorio_id"
    t.index ["rubro_id"], name: "index_productos_on_rubro_id"
  end

  create_table "proveedores", force: :cascade do |t|
    t.string "prov_nombre"
    t.string "prov_ruc"
    t.string "prov_telefono"
    t.string "prov_direc"
    t.string "prov_email"
    t.boolean "prov_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rubros", force: :cascade do |t|
    t.string "rubro_desc"
    t.integer "rubro_iva"
    t.boolean "rubro_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectores", force: :cascade do |t|
    t.string "sect_desc"
    t.boolean "sect_active", default: true
    t.bigint "almacene_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["almacene_id"], name: "index_sectores_on_almacene_id"
  end

  create_table "tipo_cajas", force: :cascade do |t|
    t.string "tcaja_desc"
    t.boolean "tcaja_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tmov_cajas", force: :cascade do |t|
    t.string "tmov_caja"
    t.boolean "tmov_es"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cajas", "tipo_cajas"
  add_foreign_key "cajas", "tmov_cajas"
  add_foreign_key "prod_farmas", "farmacos"
  add_foreign_key "prod_farmas", "productos"
  add_foreign_key "prod_sectores", "productos"
  add_foreign_key "prod_sectores", "sectores"
  add_foreign_key "productos", "laboratorios"
  add_foreign_key "productos", "rubros"
  add_foreign_key "sectores", "almacenes"
end
