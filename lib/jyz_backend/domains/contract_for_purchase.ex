defmodule JyzBackend.ContractForPurchase do
  use Ecto.Schema
  import Ecto.Changeset
  alias JyzBackend.{ContractForPurchase, ContractForPurchaseDetail}
  
  schema "contract_for_purchase" do
    field :cno, :string
    field :date, :string
    field :location, :string
    field :amount, :float
    field :partya, :string
    field :partyb, :string
    has_many :contract_for_purchase_details, ContractForPurchaseDetail, on_delete: :delete_all, on_replace: :delete
    timestamps()
  end
    
  @doc false
  def changeset(%ContractForPurchase{} = contractforpurchase, attrs) do
    contractforpurchase
      |> cast(attrs, [:cno, :date, :location, :amount, :partya, :partyb])
      |> validate_required([:cno, :date, :location, :amount, :partya, :partyb])
      |> unique_constraint(:cno)
      |> validate_length(:cno, min: 4)
  end

  # 自定义验证器
  defp validate_positive_number(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, n ->
      case n > 0 do
        true -> []
        false -> [{field, options[:message] || "invalid number"}]
      end
    end)
  end

end