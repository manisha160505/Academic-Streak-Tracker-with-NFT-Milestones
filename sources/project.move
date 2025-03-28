module MyModule::AcademicStreakTracker {
    use aptos_framework::signer;

    struct Streak has key, store {
        days: u64,
    }

    /// Function to start the streak tracking
    public fun start_streak(user: &signer) {
        let streak = Streak { days: 0 };
        move_to(user, streak);
    }

    /// Function to update the streak count
    public fun update_streak(user: &signer) acquires Streak {
        let streak = borrow_global_mut<Streak>(signer::address_of(user));
        streak.days = streak.days + 1;
    }

    /// Function to check the current streak count
    public fun get_streak(user: &signer): u64 acquires Streak {
        let streak = borrow_global<Streak>(signer::address_of(user));
        streak.days
    }
}
