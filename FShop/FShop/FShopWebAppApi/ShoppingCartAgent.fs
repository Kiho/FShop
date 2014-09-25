namespace FsWeb.Repositories

module ShoppingCart = 
    type Agent<'a> = MailboxProcessor<'a>
    let (<--) (agent:Agent<_>) msg = agent.Post(msg)

    type Cart = { Total : decimal
                  Items : Item list }

    and  Item = { Name : string
                  Quantity : int
                  Price : decimal }

    type CartMessage =
      | Add of Item
      | Remove of Item
      | Clear
      | Checkout

    //let calculateTotal items = List.sumBy (fun x -> decimal x.Quantity * x.Price) items

    type ShoppingCartAgent() =

        let calculateTotal items = 
            (0m, items)
            ||> List.fold (fun acc item -> acc + (item.Price * decimal item.Quantity))

        let remove item = 
            List.filter ((<>) item)

        let agent =
            Agent.Start(fun inbox ->
                let rec loop (cart:Cart) = async {
                    let! msg = inbox.Receive()
                    match msg with
                    | Add item    -> 
                        let items = item :: cart.Items
                        let total = calculateTotal items
                        return! loop { cart with Total = total; Items = items }
            
                    | Remove item -> 
                        let items = cart.Items |> remove item 
                        let total = calculateTotal items
                        return! loop { cart with Total = total; Items = items }
            
                    | Clear       -> 
                        return! loop { cart with Total = 0m; Items = [] }
        
                    | Checkout    -> 
                        // Some logic
                        return! loop { cart with Total = 0m; Items = [] } }

                loop { Total = 0m; Items = [] })

        member this.Add(item) = agent <-- Add item
        member this.Remove(item) = agent <-- Remove item
        member this.Clear() = agent <-- Clear
        member this.Checkout() = agent <-- Checkout