;; Research Institution Verification Contract
;; Validates and manages ocean consciousness research institutions

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-exists (err u102))
(define-constant err-unauthorized (err u103))

;; Institution data structure
(define-map institutions
  { institution-id: uint }
  {
    name: (string-ascii 100),
    principal: principal,
    verified: bool,
    verification-date: uint,
    research-areas: (list 10 (string-ascii 50)),
    credentials: (string-ascii 200)
  }
)

(define-data-var next-institution-id uint u1)

;; Register a new research institution
(define-public (register-institution
  (name (string-ascii 100))
  (research-areas (list 10 (string-ascii 50)))
  (credentials (string-ascii 200)))
  (let ((institution-id (var-get next-institution-id)))
    (asserts! (is-none (map-get? institutions { institution-id: institution-id })) err-already-exists)
    (map-set institutions
      { institution-id: institution-id }
      {
        name: name,
        principal: tx-sender,
        verified: false,
        verification-date: u0,
        research-areas: research-areas,
        credentials: credentials
      }
    )
    (var-set next-institution-id (+ institution-id u1))
    (ok institution-id)
  )
)

;; Verify an institution (owner only)
(define-public (verify-institution (institution-id uint))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (match (map-get? institutions { institution-id: institution-id })
      institution
      (begin
        (map-set institutions
          { institution-id: institution-id }
          (merge institution { verified: true, verification-date: block-height })
        )
        (ok true)
      )
      err-not-found
    )
  )
)

;; Get institution details
(define-read-only (get-institution (institution-id uint))
  (map-get? institutions { institution-id: institution-id })
)

;; Check if institution is verified
(define-read-only (is-institution-verified (institution-id uint))
  (match (map-get? institutions { institution-id: institution-id })
    institution (get verified institution)
    false
  )
)
