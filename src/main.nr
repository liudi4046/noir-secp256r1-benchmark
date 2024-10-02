use dep::std::ecdsa_secp256r1;

fn main(
    public_keys_x: [[u8; 32]; 100],
    public_keys_y: [[u8; 32]; 100],
    signatures: [[u8; 64]; 100],
    message_hashes: [[u8; 32]; 100],
) {
    for i in 0..100 {
        let valid_signature = ecdsa_secp256r1::verify_signature(
            public_keys_x[i],
            public_keys_y[i],
            signatures[i],
            message_hashes[i],
        );
        assert(valid_signature);
    }
}

