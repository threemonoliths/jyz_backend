defmodule JyzBackend.Repo.Migrations.CreateTableDispatchForPurchaseAndDetail do
  use Ecto.Migration

  def change do
    create table("dispatch_for_purchase") do
      add :billno, :string, null: false
      add :date, :string
      add :purchaser, :string
      add :stockplace, :string
      add :quantity, :float, default: 0
      add :total, :float, default: 0
      add :dispatcher, :string
      add :stockman, :string
      add :accountingclerk, :string
      add :entryperson, :string
      add :auditperson, :string
      add :state, :string
      add :auditdate, :string



      timestamps()
    end
    
    create table("dispatch_for_purchase_details") do
      add :oilname, :string, null: false
      add :unit, :string
      add :startdegree, :float, default: 0
      add :enddegree, :float, default: 0
      add :quantity, :float, default: 0
      add :confirmation, :string
     
      add :dispatch_for_purchase_id, references(:dispatch_for_purchase)
    
      timestamps()
    end

  end
end

