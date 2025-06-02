;; Communication Framework Contract
;; Facilitates ocean consciousness interaction and collaboration

(define-constant err-not-found (err u401))
(define-constant err-unauthorized (err u402))

;; Message structure
(define-map messages
  { message-id: uint }
  {
    sender: principal,
    recipient: principal,
    subject: (string-ascii 100),
    content: (string-ascii 500),
    timestamp: uint,
    message-type: (string-ascii 20),
    protocol-id: (optional uint),
    read: bool
  }
)

;; Collaboration requests
(define-map collaboration-requests
  { request-id: uint }
  {
    requester: principal,
    target-institution: uint,
    protocol-id: uint,
    message: (string-ascii 300),
    status: (string-ascii 20),
    created-at: uint
  }
)

(define-data-var next-message-id uint u1)
(define-data-var next-request-id uint u1)

;; Send message
(define-public (send-message
  (recipient principal)
  (subject (string-ascii 100))
  (content (string-ascii 500))
  (message-type (string-ascii 20))
  (protocol-id (optional uint)))
  (let ((message-id (var-get next-message-id)))
    (map-set messages
      { message-id: message-id }
      {
        sender: tx-sender,
        recipient: recipient,
        subject: subject,
        content: content,
        timestamp: block-height,
        message-type: message-type,
        protocol-id: protocol-id,
        read: false
      }
    )
    (var-set next-message-id (+ message-id u1))
    (ok message-id)
  )
)

;; Request collaboration
(define-public (request-collaboration
  (target-institution uint)
  (protocol-id uint)
  (message (string-ascii 300)))
  (let ((request-id (var-get next-request-id)))
    (map-set collaboration-requests
      { request-id: request-id }
      {
        requester: tx-sender,
        target-institution: target-institution,
        protocol-id: protocol-id,
        message: message,
        status: "pending",
        created-at: block-height
      }
    )
    (var-set next-request-id (+ request-id u1))
    (ok request-id)
  )
)

;; Mark message as read
(define-public (mark-message-read (message-id uint))
  (match (map-get? messages { message-id: message-id })
    message
    (begin
      (asserts! (is-eq (get recipient message) tx-sender) err-unauthorized)
      (map-set messages
        { message-id: message-id }
        (merge message { read: true })
      )
      (ok true)
    )
    err-not-found
  )
)

;; Get message
(define-read-only (get-message (message-id uint))
  (map-get? messages { message-id: message-id })
)
