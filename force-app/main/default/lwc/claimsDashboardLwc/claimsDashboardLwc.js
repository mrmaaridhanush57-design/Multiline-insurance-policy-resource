import { LightningElement, wire } from 'lwc';
import getClaims from '@salesforce/apex/ClaimsAdjusterController.getClaims';

const STATUS_OPTIONS = [
    { label: 'All statuses', value: '' },
    { label: 'New', value: 'New' },
    { label: 'In Review', value: 'In Review' },
    { label: 'Pending Approval', value: 'Pending Approval' },
    { label: 'Approved', value: 'Approved' },
    { label: 'Rejected', value: 'Rejected' },
    { label: 'Closed', value: 'Closed' }
];

export default class ClaimsDashboardLwc extends LightningElement {
    claims = [];
    searchTerm = '';
    statusFilter = '';
    stateFilter = '';
    errorMessage;
    isLoading = true;

    @wire(getClaims)
    wiredClaims({ data, error }) {
        if (data) {
            this.claims = data;
            this.errorMessage = undefined;
            this.isLoading = false;
        } else if (error) {
            this.claims = [];
            this.errorMessage = this.reduceError(error);
            this.isLoading = false;
        }
    }

    get statusOptions() {
        return STATUS_OPTIONS;
    }

    get visibleClaims() {
        const query = this.searchTerm.trim().toLowerCase();
        const state = this.stateFilter.trim().toLowerCase();
        return this.claims.filter((claim) => {
            const searchable = [
                claim.claimNumber,
                claim.customerName,
                claim.policyNumber,
                claim.policyType,
                claim.description
            ].filter(Boolean).join(' ').toLowerCase();
            const matchesSearch = !query || searchable.includes(query);
            const matchesStatus = !this.statusFilter || claim.status === this.statusFilter;
            const matchesState = !state ||
                (claim.stateTerritory || '').toLowerCase().includes(state);
            return matchesSearch && matchesStatus && matchesState;
        });
    }

    get hasClaims() {
        return this.claims.length > 0;
    }

    get hasNoMatches() {
        return this.visibleClaims.length === 0;
    }

    handleSearch(event) {
        this.searchTerm = event.target.value || '';
    }

    handleStatus(event) {
        this.statusFilter = event.detail.value;
    }

    handleState(event) {
        this.stateFilter = event.target.value || '';
    }

    reduceError(error) {
        const body = error && error.body;
        if (Array.isArray(body)) {
            return body.map((item) => item.message).join(', ');
        }
        return (body && body.message) || error.message || 'Unable to load claims.';
    }
}
