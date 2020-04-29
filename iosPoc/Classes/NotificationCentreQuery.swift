//  This file was automatically generated and should not be edited.

import AWSAppSync

public final class NotificationCentreQuery: GraphQLQuery {
  public static let operationString =
    "query notificationCentre($first: Int, $after: String) {\n  notifications(first: $first, after: $after) {\n    __typename\n    totalCount\n    totalUnread\n    pageInfo {\n      __typename\n      startCursor\n      hasPrevPage\n      endCursor\n      hasNextPage\n    }\n    edges {\n      __typename\n      node {\n        __typename\n        ... on ApplicationViewedNotification {\n          id\n          viewed\n          job {\n            __typename\n            id\n            title\n            url\n            advertiser {\n              __typename\n              name\n            }\n            location {\n              __typename\n              flattened\n            }\n            brandingLogo\n          }\n        }\n        ... on NewSavedSearchNotification {\n          id\n          viewed\n          jobs {\n            __typename\n            id\n            title\n            url\n            advertiser {\n              __typename\n              name\n            }\n            location {\n              __typename\n              flattened\n            }\n            brandingLogo\n          }\n        }\n      }\n      cursor\n    }\n  }\n}"

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
          public static let possibleTypes = ["ApplicationViewedNotification", "NewSavedSearchNotification"]

          public static let selections: [GraphQLSelection] = [
            GraphQLTypeCase(
              variants: ["ApplicationViewedNotification": AsApplicationViewedNotification.selections, "NewSavedSearchNotification": AsNewSavedSearchNotification.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public static func makeApplicationViewedNotification(id: GraphQLID, viewed: Bool, job: AsApplicationViewedNotification.Job? = nil) -> Node {
            return Node(snapshot: ["__typename": "ApplicationViewedNotification", "id": id, "viewed": viewed, "job": job.flatMap { $0.snapshot }])
          }

          public static func makeNewSavedSearchNotification(id: GraphQLID, viewed: Bool, jobs: [AsNewSavedSearchNotification.Job]) -> Node {
            return Node(snapshot: ["__typename": "NewSavedSearchNotification", "id": id, "viewed": viewed, "jobs": jobs.map { $0.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var asApplicationViewedNotification: AsApplicationViewedNotification? {
            get {
              if !AsApplicationViewedNotification.possibleTypes.contains(__typename) { return nil }
              return AsApplicationViewedNotification(snapshot: snapshot)
            }
            set {
              guard let newValue = newValue else { return }
              snapshot = newValue.snapshot
            }
          }

          public struct AsApplicationViewedNotification: GraphQLSelectionSet {
            public static let possibleTypes = ["ApplicationViewedNotification"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("viewed", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("job", type: .object(Job.selections)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, viewed: Bool, job: Job? = nil) {
              self.init(snapshot: ["__typename": "ApplicationViewedNotification", "id": id, "viewed": viewed, "job": job.flatMap { $0.snapshot }])
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

            public var viewed: Bool {
              get {
                return snapshot["viewed"]! as! Bool
              }
              set {
                snapshot.updateValue(newValue, forKey: "viewed")
              }
            }

            public var job: Job? {
              get {
                return (snapshot["job"] as? Snapshot).flatMap { Job(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue?.snapshot, forKey: "job")
              }
            }

            public struct Job: GraphQLSelectionSet {
              public static let possibleTypes = ["Job"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
                GraphQLField("advertiser", type: .object(Advertiser.selections)),
                GraphQLField("location", type: .object(Location.selections)),
                GraphQLField("brandingLogo", type: .scalar(URL.self)),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, title: String, url: String, advertiser: Advertiser? = nil, location: Location? = nil, brandingLogo: URL? = nil) {
                self.init(snapshot: ["__typename": "Job", "id": id, "title": title, "url": url, "advertiser": advertiser.flatMap { $0.snapshot }, "location": location.flatMap { $0.snapshot }, "brandingLogo": brandingLogo])
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

              public var title: String {
                get {
                  return snapshot["title"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "title")
                }
              }

              public var url: String {
                get {
                  return snapshot["url"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "url")
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

              public var brandingLogo: URL? {
                get {
                  return snapshot["brandingLogo"] as? URL
                }
                set {
                  snapshot.updateValue(newValue, forKey: "brandingLogo")
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
            }
          }

          public var asNewSavedSearchNotification: AsNewSavedSearchNotification? {
            get {
              if !AsNewSavedSearchNotification.possibleTypes.contains(__typename) { return nil }
              return AsNewSavedSearchNotification(snapshot: snapshot)
            }
            set {
              guard let newValue = newValue else { return }
              snapshot = newValue.snapshot
            }
          }

          public struct AsNewSavedSearchNotification: GraphQLSelectionSet {
            public static let possibleTypes = ["NewSavedSearchNotification"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("viewed", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("jobs", type: .nonNull(.list(.nonNull(.object(Job.selections))))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(id: GraphQLID, viewed: Bool, jobs: [Job]) {
              self.init(snapshot: ["__typename": "NewSavedSearchNotification", "id": id, "viewed": viewed, "jobs": jobs.map { $0.snapshot }])
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

            public var viewed: Bool {
              get {
                return snapshot["viewed"]! as! Bool
              }
              set {
                snapshot.updateValue(newValue, forKey: "viewed")
              }
            }

            public var jobs: [Job] {
              get {
                return (snapshot["jobs"] as! [Snapshot]).map { Job(snapshot: $0) }
              }
              set {
                snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "jobs")
              }
            }

            public struct Job: GraphQLSelectionSet {
              public static let possibleTypes = ["Job"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
                GraphQLField("advertiser", type: .object(Advertiser.selections)),
                GraphQLField("location", type: .object(Location.selections)),
                GraphQLField("brandingLogo", type: .scalar(URL.self)),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(id: GraphQLID, title: String, url: String, advertiser: Advertiser? = nil, location: Location? = nil, brandingLogo: URL? = nil) {
                self.init(snapshot: ["__typename": "Job", "id": id, "title": title, "url": url, "advertiser": advertiser.flatMap { $0.snapshot }, "location": location.flatMap { $0.snapshot }, "brandingLogo": brandingLogo])
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

              public var title: String {
                get {
                  return snapshot["title"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "title")
                }
              }

              public var url: String {
                get {
                  return snapshot["url"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "url")
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

              public var brandingLogo: URL? {
                get {
                  return snapshot["brandingLogo"] as? URL
                }
                set {
                  snapshot.updateValue(newValue, forKey: "brandingLogo")
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
            }
          }
        }
      }
    }
  }
}
