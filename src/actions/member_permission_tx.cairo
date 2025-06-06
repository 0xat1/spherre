#[starknet::component]
pub mod MemberPermissionTransaction {
    use spherre::types::PermissionEnum;
    use starknet::ContractAddress;
    use starknet::storage::{Map, Vec};
    #[storage]
    pub struct Storage {
        member_permission_transactions: Map<u256, StorageEditPermissionsData>,
        member_permission_transaction_ids: Vec<u256>
    }
    // This is created because we need an array to hold the permissions info
    // and normal starknet::Store attribute does not support arrays
    #[starknet::storage_node]
    pub struct StorageEditPermissionsData {
        member: ContractAddress,
        permissions: Vec<PermissionEnum>
    }
}
