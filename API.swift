//  This file was automatically generated and should not be edited.

import AWSAppSync

public final class NotificationCentreQuery: GraphQLQuery {
  public static let operationString =
    "query notificationCentre($first: Int, $after: String) {\n  notifications(first: $first, after: $after) {\n    __typename\n    totalCount\n    totalUnread\n    pageInfo {\n      __typename\n      startCursor\n      hasPrevPage\n      endCursor\n      hasNextPage\n    }\n    edges {\n      __typename\n      node {\n        __typename\n        id\n        allowFallback\n        viewed {\n          __typename\n          ...actionable\n        }\n        items {\n          __typename\n          ... on Job {\n            id\n            title {\n              __typename\n              ...actionable\n            }\n            advertiser {\n              __typename\n              name\n            }\n            location {\n              __typename\n              flattened\n            }\n            branding {\n              __typename\n              logo\n              tooltip\n            }\n          }\n          ... on NotificationItem {\n            id\n            title {\n              __typename\n              ...actionable\n            }\n          }\n        }\n      }\n      cursor\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(Actionable.fragmentString) }

  public var first: Int?
  public var after: String?

  public init(first: Int? = nil, after: String? = nil) {
    self.first = first
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["first": first, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("notifications", arguments: ["first": GraphQLVariable("first"), "after": GraphQLVariable("after")], type: .nonNull(.object(Notification.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(notifications: Notification) {
      self.init(snapshot: ["__typename": "Query", "notifications": notifications.snapshot])
    }

    public var notifications: Notification {
      get {
        return Notification(snapshot: snapshot["notifications"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "notifications")
      }
    }

    public struct Notification: GraphQLSelectionSet {
      public static let possibleTypes = ["NotificationConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("totalUnread", type: .nonNull(.scalar(Int.self))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(totalCount: Int, totalUnread: Int, pageInfo: PageInfo, edges: [Edge]) {
        self.init(snapshot: ["__typename": "NotificationConnection", "totalCount": totalCount, "totalUnread": totalUnread, "pageInfo": pageInfo.snapshot, "edges": edges.map { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var totalCount: Int {
        get {
          return snapshot["totalCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "totalCount")
        }
      }

      public var totalUnread: Int {
        get {
          return snapshot["totalUnread"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "totalUnread")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
        }
      }

      public var edges: [Edge] {
        get {
          return (snapshot["edges"] as! [Snapshot]).map { Edge(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "edges")
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("startCursor", type: .nonNull(.scalar(String.self))),
          GraphQLField("hasPrevPage", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("endCursor", type: .nonNull(.scalar(String.self))),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(startCursor: String, hasPrevPage: Bool, endCursor: String, hasNextPage: Bool) {
          self.init(snapshot: ["__typename": "PageInfo", "startCursor": startCursor, "hasPrevPage": hasPrevPage, "endCursor": endCursor, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var startCursor: String {
          get {
            return snapshot["startCursor"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "startCursor")
          }
        }

        public var hasPrevPage: Bool {
          get {
            return snapshot["hasPrevPage"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "hasPrevPage")
          }
        }

        public var endCursor: String {
          get {
            return snapshot["endCursor"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "endCursor")
          }
        }

        public var hasNextPage: Bool {
          get {
            return snapshot["hasNextPage"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["NotificationEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
          GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(node: Node? = nil, cursor: String) {
          self.init(snapshot: ["__typename": "NotificationEdge", "node": node.flatMap { $0.snapshot }, "cursor": cursor])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var node: Node? {
          get {
            return (snapshot["node"] as? Snapshot).flatMap { Node(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "node")
          }
        }

        public var cursor: String {
          get {
            return snapshot["cursor"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cursor")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["SimpleNotification"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("allowFallback", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("viewed", type: .nonNull(.object(Viewed.selections))),
            GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, allowFallback: Bool, viewed: Viewed, items: [Item]) {
            self.init(snapshot: ["__typename": "SimpleNotification", "id": id, "allowFallback": allowFallback, "viewed": viewed.snapshot, "items": items.map { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var allowFallback: Bool {
            get {
              return snapshot["allowFallback"]! as! Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "allowFallback")
            }
          }

          public var viewed: Viewed {
            get {
              return Viewed(snapshot: snapshot["viewed"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "viewed")
            }
          }

          public var items: [Item] {
            get {
              return (snapshot["items"] as! [Snapshot]).map { Item(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "items")
            }
          }

          public struct Viewed: GraphQLSelectionSet {
            public static let possibleTypes = ["Actionable"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("text", type: .nonNull(.scalar(String.self))),
              GraphQLField("actions", type: .list(.nonNull(.object(Action.selections)))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(text: String, actions: [Action]? = nil) {
              self.init(snapshot: ["__typename": "Actionable", "text": text, "actions": actions.flatMap { $0.map { $0.snapshot } }])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var text: String {
              get {
                return snapshot["text"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "text")
              }
            }

            public var actions: [Action]? {
              get {
                return (snapshot["actions"] as? [Snapshot]).flatMap { $0.map { Action(snapshot: $0) } }
              }
              set {
                snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "actions")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var actionable: Actionable {
                get {
                  return Actionable(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct Action: GraphQLSelectionSet {
              public static let possibleTypes = ["NavigationAction", "MutationAction"]

              public static let selections: [GraphQLSelection] = [
                GraphQLTypeCase(
                  variants: ["NavigationAction": AsNavigationAction.selections, "MutationAction": AsMutationAction.selections],
                  default: [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("action", type: .scalar(String.self)),
                  ]
                )
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public static func makeNavigationAction(action: String? = nil) -> Action {
                return Action(snapshot: ["__typename": "NavigationAction", "action": action])
              }

              public static func makeMutationAction(action: String? = nil) -> Action {
                return Action(snapshot: ["__typename": "MutationAction", "action": action])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var action: String? {
                get {
                  return snapshot["action"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "action")
                }
              }

              public var asNavigationAction: AsNavigationAction? {
                get {
                  if !AsNavigationAction.possibleTypes.contains(__typename) { return nil }
                  return AsNavigationAction(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public struct AsNavigationAction: GraphQLSelectionSet {
                public static let possibleTypes = ["NavigationAction"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("action", type: .scalar(String.self)),
                  GraphQLField("action", type: .scalar(String.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(action: String? = nil) {
                  self.init(snapshot: ["__typename": "NavigationAction", "action": action])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var action: String? {
                  get {
                    return snapshot["action"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "action")
                  }
                }
              }

              public var asMutationAction: AsMutationAction? {
                get {
                  if !AsMutationAction.possibleTypes.contains(__typename) { return nil }
                  return AsMutationAction(snapshot: snapshot)
                }
                set {
                  guard let newValue = newValue else { return }
                  snapshot = newValue.snapshot
                }
              }

              public struct AsMutationAction: GraphQLSelectionSet {
                public static let possibleTypes = ["MutationAction"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("action", type: .scalar(String.self)),
                  GraphQLField("action", type: .scalar(String.self)),
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public init(action: String? = nil) {
                  self.init(snapshot: ["__typename": "MutationAction", "action": action])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var action: String? {
                  get {
                    return snapshot["action"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "action")
                  }
                }
              }
            }
          }

          public struct Item: GraphQLSelectionSet {
            public static let possibleTypes = ["Job"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("title", type: .nonNull(.object(Title.selections))),
              GraphQLField("advertiser", type: .object(Advertiser.selections)),
              GraphQLField("location", type: .object(Location.selections)),
              GraphQLField("branding", type: .object(Branding.selections)),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("title", type: .nonNull(.object(Title.selections))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, title: Title, advertiser: Advertiser? = nil, location: Location? = nil, branding: Branding? = nil) {
              self.init(snapshot: ["__typename": "Job", "id": id, "title": title.snapshot, "advertiser": advertiser.flatMap { $0.snapshot }, "location": location.flatMap { $0.snapshot }, "branding": branding.flatMap { $0.snapshot }])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return snapshot["id"]! as! GraphQLID
              }
              set {
                snapshot.updateValue(newValue, forKey: "id")
              }
            }

            public var title: Title {
              get {
                return Title(snapshot: snapshot["title"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "title")
              }
            }

            public var advertiser: Advertiser? {
              get {
                return (snapshot["advertiser"] as? Snapshot).flatMap { Advertiser(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue?.snapshot, forKey: "advertiser")
              }
            }

            public var location: Location? {
              get {
                return (snapshot["location"] as? Snapshot).flatMap { Location(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue?.snapshot, forKey: "location")
              }
            }

            public var branding: Branding? {
              get {
                return (snapshot["branding"] as? Snapshot).flatMap { Branding(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue?.snapshot, forKey: "branding")
              }
            }

            public struct Title: GraphQLSelectionSet {
              public static let possibleTypes = ["Actionable"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("text", type: .nonNull(.scalar(String.self))),
                GraphQLField("actions", type: .list(.nonNull(.object(Action.selections)))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(text: String, actions: [Action]? = nil) {
                self.init(snapshot: ["__typename": "Actionable", "text": text, "actions": actions.flatMap { $0.map { $0.snapshot } }])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var text: String {
                get {
                  return snapshot["text"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "text")
                }
              }

              public var actions: [Action]? {
                get {
                  return (snapshot["actions"] as? [Snapshot]).flatMap { $0.map { Action(snapshot: $0) } }
                }
                set {
                  snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "actions")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public struct Fragments {
                public var snapshot: Snapshot

                public var actionable: Actionable {
                  get {
                    return Actionable(snapshot: snapshot)
                  }
                  set {
                    snapshot += newValue.snapshot
                  }
                }
              }

              public struct Action: GraphQLSelectionSet {
                public static let possibleTypes = ["NavigationAction", "MutationAction"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLTypeCase(
                    variants: ["NavigationAction": AsNavigationAction.selections, "MutationAction": AsMutationAction.selections],
                    default: [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("action", type: .scalar(String.self)),
                    ]
                  )
                ]

                public var snapshot: Snapshot

                public init(snapshot: Snapshot) {
                  self.snapshot = snapshot
                }

                public static func makeNavigationAction(action: String? = nil) -> Action {
                  return Action(snapshot: ["__typename": "NavigationAction", "action": action])
                }

                public static func makeMutationAction(action: String? = nil) -> Action {
                  return Action(snapshot: ["__typename": "MutationAction", "action": action])
                }

                public var __typename: String {
                  get {
                    return snapshot["__typename"]! as! String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var action: String? {
                  get {
                    return snapshot["action"] as? String
                  }
                  set {
                    snapshot.updateValue(newValue, forKey: "action")
                  }
                }

                public var asNavigationAction: AsNavigationAction? {
                  get {
                    if !AsNavigationAction.possibleTypes.contains(__typename) { return nil }
                    return AsNavigationAction(snapshot: snapshot)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    snapshot = newValue.snapshot
                  }
                }

                public struct AsNavigationAction: GraphQLSelectionSet {
                  public static let possibleTypes = ["NavigationAction"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("action", type: .scalar(String.self)),
                    GraphQLField("action", type: .scalar(String.self)),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(action: String? = nil) {
                    self.init(snapshot: ["__typename": "NavigationAction", "action": action])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var action: String? {
                    get {
                      return snapshot["action"] as? String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "action")
                    }
                  }
                }

                public var asMutationAction: AsMutationAction? {
                  get {
                    if !AsMutationAction.possibleTypes.contains(__typename) { return nil }
                    return AsMutationAction(snapshot: snapshot)
                  }
                  set {
                    guard let newValue = newValue else { return }
                    snapshot = newValue.snapshot
                  }
                }

                public struct AsMutationAction: GraphQLSelectionSet {
                  public static let possibleTypes = ["MutationAction"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("action", type: .scalar(String.self)),
                    GraphQLField("action", type: .scalar(String.self)),
                  ]

                  public var snapshot: Snapshot

                  public init(snapshot: Snapshot) {
                    self.snapshot = snapshot
                  }

                  public init(action: String? = nil) {
                    self.init(snapshot: ["__typename": "MutationAction", "action": action])
                  }

                  public var __typename: String {
                    get {
                      return snapshot["__typename"]! as! String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var action: String? {
                    get {
                      return snapshot["action"] as? String
                    }
                    set {
                      snapshot.updateValue(newValue, forKey: "action")
                    }
                  }
                }
              }
            }

            public struct Advertiser: GraphQLSelectionSet {
              public static let possibleTypes = ["Advertiser"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(name: String) {
                self.init(snapshot: ["__typename": "Advertiser", "name": name])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var name: String {
                get {
                  return snapshot["name"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "name")
                }
              }
            }

            public struct Location: GraphQLSelectionSet {
              public static let possibleTypes = ["Location"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("flattened", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(flattened: String) {
                self.init(snapshot: ["__typename": "Location", "flattened": flattened])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var flattened: String {
                get {
                  return snapshot["flattened"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "flattened")
                }
              }
            }

            public struct Branding: GraphQLSelectionSet {
              public static let possibleTypes = ["Branding"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("logo", type: .nonNull(.scalar(URL.self))),
                GraphQLField("tooltip", type: .scalar(String.self)),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(logo: URL, tooltip: String? = nil) {
                self.init(snapshot: ["__typename": "Branding", "logo": logo, "tooltip": tooltip])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var logo: URL {
                get {
                  return snapshot["logo"]! as! URL
                }
                set {
                  snapshot.updateValue(newValue, forKey: "logo")
                }
              }

              public var tooltip: String? {
                get {
                  return snapshot["tooltip"] as? String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "tooltip")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class NotificationUpdateViewedMutation: GraphQLMutation {
  public static let operationString =
    "mutation notificationUpdateViewed($id: ID!) {\n  notificationUpdateViewed(input: {id: $id}) {\n    __typename\n    node {\n      __typename\n      id\n      viewed {\n        __typename\n        text\n        actions {\n          __typename\n          action\n        }\n      }\n      date\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("notificationUpdateViewed", arguments: ["input": ["id": GraphQLVariable("id")]], type: .nonNull(.object(NotificationUpdateViewed.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(notificationUpdateViewed: NotificationUpdateViewed) {
      self.init(snapshot: ["__typename": "Mutation", "notificationUpdateViewed": notificationUpdateViewed.snapshot])
    }

    public var notificationUpdateViewed: NotificationUpdateViewed {
      get {
        return NotificationUpdateViewed(snapshot: snapshot["notificationUpdateViewed"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "notificationUpdateViewed")
      }
    }

    public struct NotificationUpdateViewed: GraphQLSelectionSet {
      public static let possibleTypes = ["NotificationUpdateViewedPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("node", type: .object(Node.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(node: Node? = nil) {
        self.init(snapshot: ["__typename": "NotificationUpdateViewedPayload", "node": node.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var node: Node? {
        get {
          return (snapshot["node"] as? Snapshot).flatMap { Node(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "node")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes = ["SimpleNotification"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("viewed", type: .nonNull(.object(Viewed.selections))),
          GraphQLField("date", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, viewed: Viewed, date: String? = nil) {
          self.init(snapshot: ["__typename": "SimpleNotification", "id": id, "viewed": viewed.snapshot, "date": date])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var viewed: Viewed {
          get {
            return Viewed(snapshot: snapshot["viewed"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "viewed")
          }
        }

        public var date: String? {
          get {
            return snapshot["date"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "date")
          }
        }

        public struct Viewed: GraphQLSelectionSet {
          public static let possibleTypes = ["Actionable"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("text", type: .nonNull(.scalar(String.self))),
            GraphQLField("actions", type: .list(.nonNull(.object(Action.selections)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(text: String, actions: [Action]? = nil) {
            self.init(snapshot: ["__typename": "Actionable", "text": text, "actions": actions.flatMap { $0.map { $0.snapshot } }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var text: String {
            get {
              return snapshot["text"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "text")
            }
          }

          public var actions: [Action]? {
            get {
              return (snapshot["actions"] as? [Snapshot]).flatMap { $0.map { Action(snapshot: $0) } }
            }
            set {
              snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "actions")
            }
          }

          public struct Action: GraphQLSelectionSet {
            public static let possibleTypes = ["NavigationAction", "MutationAction"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("action", type: .scalar(String.self)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeNavigationAction(action: String? = nil) -> Action {
              return Action(snapshot: ["__typename": "NavigationAction", "action": action])
            }

            public static func makeMutationAction(action: String? = nil) -> Action {
              return Action(snapshot: ["__typename": "MutationAction", "action": action])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var action: String? {
              get {
                return snapshot["action"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "action")
              }
            }
          }
        }
      }
    }
  }
}

public struct Actionable: GraphQLFragment {
  public static let fragmentString =
    "fragment actionable on Actionable {\n  __typename\n  text\n  actions {\n    __typename\n    action\n    ... on NavigationAction {\n      action\n    }\n    ... on MutationAction {\n      action\n    }\n  }\n}"

  public static let possibleTypes = ["Actionable"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("text", type: .nonNull(.scalar(String.self))),
    GraphQLField("actions", type: .list(.nonNull(.object(Action.selections)))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(text: String, actions: [Action]? = nil) {
    self.init(snapshot: ["__typename": "Actionable", "text": text, "actions": actions.flatMap { $0.map { $0.snapshot } }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var text: String {
    get {
      return snapshot["text"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "text")
    }
  }

  public var actions: [Action]? {
    get {
      return (snapshot["actions"] as? [Snapshot]).flatMap { $0.map { Action(snapshot: $0) } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "actions")
    }
  }

  public struct Action: GraphQLSelectionSet {
    public static let possibleTypes = ["NavigationAction", "MutationAction"]

    public static let selections: [GraphQLSelection] = [
      GraphQLTypeCase(
        variants: ["NavigationAction": AsNavigationAction.selections, "MutationAction": AsMutationAction.selections],
        default: [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("action", type: .scalar(String.self)),
        ]
      )
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public static func makeNavigationAction(action: String? = nil) -> Action {
      return Action(snapshot: ["__typename": "NavigationAction", "action": action])
    }

    public static func makeMutationAction(action: String? = nil) -> Action {
      return Action(snapshot: ["__typename": "MutationAction", "action": action])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var action: String? {
      get {
        return snapshot["action"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "action")
      }
    }

    public var asNavigationAction: AsNavigationAction? {
      get {
        if !AsNavigationAction.possibleTypes.contains(__typename) { return nil }
        return AsNavigationAction(snapshot: snapshot)
      }
      set {
        guard let newValue = newValue else { return }
        snapshot = newValue.snapshot
      }
    }

    public struct AsNavigationAction: GraphQLSelectionSet {
      public static let possibleTypes = ["NavigationAction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action", type: .scalar(String.self)),
        GraphQLField("action", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(action: String? = nil) {
        self.init(snapshot: ["__typename": "NavigationAction", "action": action])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var action: String? {
        get {
          return snapshot["action"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "action")
        }
      }
    }

    public var asMutationAction: AsMutationAction? {
      get {
        if !AsMutationAction.possibleTypes.contains(__typename) { return nil }
        return AsMutationAction(snapshot: snapshot)
      }
      set {
        guard let newValue = newValue else { return }
        snapshot = newValue.snapshot
      }
    }

    public struct AsMutationAction: GraphQLSelectionSet {
      public static let possibleTypes = ["MutationAction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("action", type: .scalar(String.self)),
        GraphQLField("action", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(action: String? = nil) {
        self.init(snapshot: ["__typename": "MutationAction", "action": action])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var action: String? {
        get {
          return snapshot["action"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "action")
        }
      }
    }
  }
}