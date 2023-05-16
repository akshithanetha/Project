class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :manager_id
end
